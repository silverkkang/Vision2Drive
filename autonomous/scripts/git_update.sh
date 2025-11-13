#!/usr/bin/env bash
set -euo pipefail

# 옵션:
#  -r : rebase (기본은 merge)
#  -s : 변경사항 자동 stash
#  -P : upstream 기준 동기화 후 origin/main에도 push (fork 동기화)
USE_REBASE=0
USE_STASH=0
PUSH_MAIN_TO_ORIGIN=0
while getopts "rsP" opt; do
  case "$opt" in
    r) USE_REBASE=1 ;;
    s) USE_STASH=1 ;;
    P) PUSH_MAIN_TO_ORIGIN=1 ;;
  esac
done

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "❌ Git 저장소가 아님"; exit 1; }

CUR_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$CUR_BRANCH" == "HEAD" ]]; then
  echo "❌ 분리된 HEAD 상태. 브랜치로 전환 후 실행하세요."
  exit 1
fi

STASHED=0
if [[ -n "$(git status --porcelain)" ]]; then
  if [[ $USE_STASH -eq 1 ]]; then
    echo "🔸 변경사항 임시 보관(stash)"
    git stash push -u -m "auto-stash by git_update.sh"
    STASHED=1
  else
    echo "❌ 커밋되지 않은 변경사항이 있습니다. (또는 -s 로 자동 stash)"
    git status --short
    exit 1
  fi
fi

echo "🔄 git fetch --all --prune"
git fetch --all --prune

HAS_UPSTREAM=0
if git remote get-url upstream >/dev/null 2>&1; then
  HAS_UPSTREAM=1
fi
BASE_REMOTE="origin"
if [[ $HAS_UPSTREAM -eq 1 ]]; then
  BASE_REMOTE="upstream"
fi

echo "📌 main 최신화 (기준: $BASE_REMOTE/main)"
git switch main >/dev/null 2>&1 || git checkout -b main
git fetch "$BASE_REMOTE" --prune
git merge --ff-only "$BASE_REMOTE/main" 2>/dev/null || git merge --no-edit "$BASE_REMOTE/main"

if [[ $HAS_UPSTREAM -eq 1 && $PUSH_MAIN_TO_ORIGIN -eq 1 ]]; then
  echo "⬆️ origin/main 동기화 푸시"
  git push origin main
fi

if [[ "$CUR_BRANCH" != "main" ]]; then
  git switch "$CUR_BRANCH"
  if [[ $USE_REBASE -eq 1 ]]; then
    echo "📚 rebase: $CUR_BRANCH onto main"
    git rebase main
  else
    echo "📚 merge: main -> $CUR_BRANCH"
    git merge main --no-edit
  fi
else
  echo "ℹ️ 현재 main 브랜치입니다. 개인 작업은 별도 브랜치에서 권장."
fi

if [[ $STASHED -eq 1 ]]; then
  echo "🎒 stash 복구"
  git stash pop || true
fi

if [[ -f ".gitmodules" ]]; then
  echo "🧩 submodule update --init --recursive"
  git submodule update --init --recursive
fi

echo "✅ 최신화 완료!"

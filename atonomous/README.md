# Vision2Drive 🚗

자율주행 기술을 파이썬으로 배우는 학습 프로젝트

## 팀 소개
- **기계공학**: 자율주행 시스템 구현
- **보안/해킹**: 자율주행 보안 취약점 분석

—

## 📚 학습 계획

### 1️⃣ K-MOOC 강의 수강

#### 현대NGV 자율주행 인공지능 시스템
**강의 링크**: [K-MOOC 자율주행](https://edu.hyundai-ngv.com)

**강의 내용**
- 자율주행 개요 및 레벨 이해
- 자율주행 센서 기술 (Camera, LiDAR, Radar)
- 인지 시스템 (Object Detection, Segmentation)
- 경로 계획 및 제어
- 딥러닝 기반 자율주행

**수강 체크리스트**
- [ ] Week 1: 자율주행 개론
- [ ] Week 2: 센서 및 데이터 처리
- [ ] Week 3: 컴퓨터 비전 기초
- [ ] Week 4: 딥러닝 기반 인지
- [ ] Week 5: 경로 계획
- [ ] Week 6: 자율주행 제어
- [ ] Week 7: 시뮬레이션 및 검증
- [ ] Week 8: 최신 기술 동향

**학습 노트**
- `docs/kmooc-notes/` 폴더에 주차별 정리

—

### 2️⃣ Udacity 프로젝트

각 프로젝트는 `projects/` 폴더에 정리합니다.

#### Project 1: 기본 차선 인식 (2주)
📁 `projects/P1-Lane-Detection/`

**레포**: [CarND-LaneLines-P1](https://github.com/udacity/CarND-LaneLines-P1)

**배우는 것**
- 색상 필터링 (White/Yellow 차선)
- Canny Edge Detection
- Region of Interest (ROI) 설정
- Hough Transform으로 선 검출
- 차선 그리기

**실행 방법**
```bash
git clone https://github.com/udacity/CarND-LaneLines-P1.git projects/P1-Lane-Detection
cd projects/P1-Lane-Detection
pip install -r requirements.txt
jupyter notebook P1.ipynb
```

**체크리스트**
- [ ] 직선 차선 인식 완료
- [ ] 영상에서 실시간 처리
- [ ] 다양한 조명 조건 테스트

—

#### Project 2: 고급 차선 인식 (3주)
📁 `projects/P2-Advanced-Lane-Lines/`

**레포**: [CarND-Advanced-Lane-Lines](https://github.com/udacity/CarND-Advanced-Lane-Lines)

**배우는 것**
- 카메라 캘리브레이션 (왜곡 보정)
- Perspective Transform (Bird's Eye View)
- 곡선 차선 인식 (2차 다항식)
- 차선 곡률 계산

**실행 방법**
```bash
git clone https://github.com/udacity/CarND-Advanced-Lane-Lines.git projects/P2-Advanced-Lane-Lines
cd projects/P2-Advanced-Lane-Lines
pip install -r requirements.txt
jupyter notebook
```

**체크리스트**
- [ ] 카메라 캘리브레이션 이해
- [ ] 곡선 차선 인식
- [ ] 차선 이탈 경고 구현

—

#### Project 3: 교통 표지판 분류 (3주)
📁 `projects/P3-Traffic-Sign-Classifier/`

**레포**: [CarND-Traffic-Sign-Classifier-Project](https://github.com/udacity/CarND-Traffic-Sign-Classifier-Project)

**배우는 것**
- CNN (Convolutional Neural Network)
- LeNet 아키텍처
- 데이터 증강 (Data Augmentation)
- 모델 학습 및 평가

**실행 방법**
```bash
git clone https://github.com/udacity/CarND-Traffic-Sign-Classifier-Project.git projects/P3-Traffic-Sign
cd projects/P3-Traffic-Sign
pip install tensorflow opencv-python numpy matplotlib
jupyter notebook Traffic_Sign_Classifier.ipynb
```

**체크리스트**
- [ ] CNN 모델 구현
- [ ] 95% 이상 정확도 달성
- [ ] 실제 도로 표지판 테스트

---

#### Project 4: 행동 복제 (4주)
📁 `projects/P4-Behavioral-Cloning/`

**레포**: [CarND-Behavioral-Cloning-P3](https://github.com/udacity/CarND-Behavioral-Cloning-P3)

**배우는 것**
- 시뮬레이터에서 데이터 수집
- End-to-End Learning
- 운전 행동 학습
- 모델 일반화

**시뮬레이터 다운로드**
- [Self-Driving Car Simulator](https://github.com/udacity/self-driving-car-sim) 
- Windows/Mac/Linux 버전 있음

**실행 방법**
```bash
git clone https://github.com/udacity/CarND-Behavioral-Cloning-P3.git projects/P4-Behavioral-Cloning
cd projects/P4-Behavioral-Cloning
pip install -r requirements.txt
python drive.py model.h5  # 학습된 모델로 자율주행
```

**체크리스트**
- [ ] 시뮬레이터 데이터 수집
- [ ] 신경망 모델 학습
- [ ] 자율주행 성공 (트랙 1바퀴)

---

## 📂 프로젝트 구조

```
Vision2Drive/
├── README.md
├── docs/
│   ├── kmooc-notes/           # K-MOOC 강의 노트
│   └── weekly-logs/           # 주간 학습 일지
└── projects/
    ├── P1-Lane-Detection/
    ├── P2-Advanced-Lane-Lines/
    ├── P3-Traffic-Sign/
    └── P4-Behavioral-Cloning/
```

---

## 🔧 환경 설정

```bash
# 가상환경 생성
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 기본 패키지
pip install numpy opencv-python matplotlib jupyter
pip install tensorflow torch torchvision
```

---

## 📖 참고 자료

- [K-MOOC 자율주행](https://edu.hyundai-ngv.com)
- [Udacity Self-Driving Car GitHub](https://github.com/udacity/self-driving-car)
- [점프 투 파이썬](https://wikidocs.net/book/1)
- [PyTorch 한국어 튜토리얼](https://tutorials.pytorch.kr/)

---

## 🎯 학습 목표

### 2025 Q1 (1-3월)
- [ ] K-MOOC 강의 완강
- [ ] Udacity P1, P2 완료

### 2025 Q2 (4-6월)
- [ ] Udacity P3, P4 완료
- [ ] 통합 프로젝트 시작

—

## 📜 라이선스

MIT License

—

**Last Updated**: 2025-11-09

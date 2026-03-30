# SleepToggle 🎵

macOS 메뉴바 앱 — 덮개를 닫아도 음악이 계속 재생됩니다.

A macOS menu bar app that keeps music playing even when the lid is closed.

## 지원 언어 / Languages
- 한국어
- English
- 日本語
- 简体中文
- 繁體中文

## 설치 방법 / Installation

### 1. 저장소 다운로드
```bash
git clone https://github.com/minsu0192/SleepToggle.git
```

### 2. sudo 권한 설정 (최초 1회)
터미널에서 아래 명령어 입력 (USERNAME을 본인 맥북 사용자 이름으로 변경):
```bash
whoami  # 본인 사용자 이름 확인
echo "USERNAME ALL=(ALL) NOPASSWD: /usr/bin/pmset" | sudo tee /etc/sudoers.d/sleeptoggle
```

### 3. Xcode로 빌드 후 실행
Xcode에서 프로젝트 열고 ▶ 실행

## 사용법 / Usage
1. 메뉴바에서 ♩ 아이콘 클릭
2. 토글 켜기 → ♪ 로 변경됨
3. 덮개를 닫아도 음악 재생 유지!

## 요구사항 / Requirements
- macOS 11.0+
- Xcode 13+

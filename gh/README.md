# GitHub CLI 계정 관리 도구

GitHub CLI 계정 전환과 Git 사용자 설정 동기화를 자동화하는 스크립트 모음입니다.

## 스크립트 목록

### 1. sync-git-user.sh
GitHub CLI의 현재 활성 계정 정보를 Git 로컬 저장소 설정에 자동으로 동기화합니다.

**기능:**
- GitHub CLI 활성 계정 정보 조회
- Git 로컬 `user.name` 및 `user.email` 자동 설정
- GitHub 프로필의 이름과 이메일을 Git 설정에 반영

**사용법:**
```bash
./sync-git-user.sh
```

**요구사항:**
- Git 저장소 내에서 실행
- GitHub CLI 로그인 상태 (`gh auth login`)

### 2. switch-github-user.sh
GitHub CLI 계정을 전환하고 Git 사용자 설정을 자동으로 동기화합니다.

**기능:**
- GitHub CLI 계정 전환
- 전환 후 Git 로컬 설정 자동 동기화
- 사용 가능한 계정 목록 표시

**사용법:**
```bash
# 특정 사용자로 전환
./switch-github-user.sh [GitHub사용자명]

# 사용 가능한 계정 목록 확인
./switch-github-user.sh
```

## 사용 예시

### 계정 전환 및 동기화
```bash
# 계정 전환 (Git 설정도 자동 동기화됨)
./switch-github-user.sh myusername

# 현재 계정으로 Git 설정만 동기화
./sync-git-user.sh
```

### 설정 확인
```bash
# 현재 GitHub CLI 계정 확인
gh auth status

# 현재 Git 로컬 설정 확인
git config --local user.name
git config --local user.email
```

## 주의사항

- 스크립트는 Git 저장소 내에서 실행해야 합니다
- GitHub CLI에 미리 로그인되어 있어야 합니다 (`gh auth login`)
- 이메일이 GitHub 프로필에서 공개로 설정되어 있지 않으면 수동 설정이 필요합니다
- 로컬 Git 설정만 변경되며, 글로벌 설정은 영향받지 않습니다

## 설치 및 권한 설정

```bash
# 실행 권한 부여
chmod +x sync-git-user.sh
chmod +x switch-github-user.sh
```

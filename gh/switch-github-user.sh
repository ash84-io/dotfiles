#!/bin/bash

# GitHub CLI 계정 전환과 Git 사용자 동기화를 한 번에 처리하는 스크립트

if [ $# -eq 0 ]; then
    echo "사용법: $0 [GitHub 사용자명]"
    echo ""
    echo "사용 가능한 계정:"
    gh auth status | grep "account" | sed 's/.*account /  - /'
    exit 1
fi

USERNAME=$1

echo "🔄 GitHub CLI 계정을 '$USERNAME'으로 전환 중..."
gh auth switch --user "$USERNAME"

if [ $? -eq 0 ]; then
    echo ""
    echo "🔧 Git 사용자 설정을 동기화 중..."
    ./sync-git-user.sh
else
    echo "❌ 계정 전환에 실패했습니다."
    echo "사용 가능한 계정을 확인해주세요:"
    gh auth status | grep "account" | sed 's/.*account /  - /'
fi

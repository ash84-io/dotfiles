#!/bin/bash

# GitHub CLI 활성 계정 정보를 가져와서 Git 사용자 설정을 자동으로 동기화하는 스크립트

echo "🔍 현재 GitHub CLI 활성 계정 확인 중..."

# 현재 활성 계정 정보 가져오기
GITHUB_USER=$(gh api user --jq '.login' 2>/dev/null)
GITHUB_NAME=$(gh api user --jq '.name' 2>/dev/null)
GITHUB_EMAIL=$(gh api user --jq '.email' 2>/dev/null)

if [ -z "$GITHUB_USER" ]; then
    echo "❌ GitHub CLI에 로그인되어 있지 않습니다."
    echo "   'gh auth login' 명령으로 먼저 로그인해주세요."
    exit 1
fi

echo "✅ GitHub CLI 활성 계정: $GITHUB_USER"
echo "📝 이름: $GITHUB_NAME"
echo "📧 이메일: $GITHUB_EMAIL"

# Git 로컬 사용자 설정 업데이트
echo ""

# 현재 디렉토리가 Git 저장소인지 확인
if [ ! -d ".git" ]; then
    echo "❌ 현재 디렉토리가 Git 저장소가 아닙니다."
    echo "   Git 저장소 내에서 실행해주세요."
    exit 1
fi

echo "🔧 Git 로컬 사용자 설정을 업데이트 중..."

if [ ! -z "$GITHUB_NAME" ]; then
    git config --local user.name "$GITHUB_NAME"
    echo "✅ user.name = $GITHUB_NAME (로컬 설정)"
else
    git config --local user.name "$GITHUB_USER"
    echo "✅ user.name = $GITHUB_USER (로컬 설정, 이름이 없어서 username 사용)"
fi

if [ ! -z "$GITHUB_EMAIL" ]; then
    git config --local user.email "$GITHUB_EMAIL"
    echo "✅ user.email = $GITHUB_EMAIL (로컬 설정)"
else
    echo "⚠️  GitHub 프로필에 공개 이메일이 설정되어 있지 않습니다."
    echo "   GitHub 설정에서 이메일을 공개로 설정하거나 수동으로 설정해주세요:"
    echo "   git config --local user.email 'your-email@example.com'"
fi

echo ""
echo "🎉 Git 로컬 사용자 설정이 GitHub CLI 활성 계정과 동기화되었습니다!"
echo ""
echo "현재 Git 로컬 설정:"
echo "  user.name  = $(git config --local user.name)"
echo "  user.email = $(git config --local user.email)"

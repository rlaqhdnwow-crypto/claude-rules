# claude-rules
규칙

## 파일
- `CLAUDE.md` — 모든 프로젝트 공통 규칙. 세션을 열 때 `~/.claude/CLAUDE.md`로 받아요.
- `skills.sh` — 공용 스킬 설치. 세션을 열 때 `~/.claude/skills`·`~/.claude/agents`에 깔아요.

## 환경 설정 스크립트에 넣을 줄 (설정 → 환경 → 설정 스크립트)
```
mkdir -p /root/.claude
curl -fsSL https://raw.githubusercontent.com/rlaqhdnwow-crypto/claude-rules/main/CLAUDE.md -o /root/.claude/CLAUDE.md.new && mv /root/.claude/CLAUDE.md.new /root/.claude/CLAUDE.md || true
curl -fsSL https://raw.githubusercontent.com/rlaqhdnwow-crypto/claude-rules/main/skills.sh | bash || true
```

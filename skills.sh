#!/usr/bin/env bash
# 보우 11/25: 모든 클라우드 환경이 세션을 열 때 받아 돌리는 공용 스킬 설치 파일.
# 스킬을 더하거나 빼려면 이 파일만 고치면 모든 환경에 같이 적용돼요.
# 영상 스킬 8개 중 7묶음 (Claude-Mem은 뒤에서 도는 서버가 필요하고 클라우드에선 기억이 안 남아서 뺌).
# 하나가 실패해도 나머지는 깔고, 세션은 늘 정상으로 열리게 끝은 true.
S=/root/.claude/skills; A=/root/.claude/agents; T=$(mktemp -d); mkdir -p $S $A
g(){ git clone -q --depth 1 --filter=blob:none --sparse https://github.com/$1 $T/$2 && git -C $T/$2 sparse-checkout set $3; }
# 1 그릴미
g mattpocock/skills mp skills/productivity && cp -rL $T/mp/skills/productivity/{grill-me,grilling} $S/ || true
# 2 포니테일
g DietrichGebert/ponytail pt skills && cp -rL $T/pt/skills/* $S/ || true
# 3 UI UX 프로 맥스
g nextlevelbuilder/ui-ux-pro-max-skill ux .claude/skills/ui-ux-pro-max && cp -rL $T/ux/.claude/skills/ui-ux-pro-max $S/ || true
# 4 마케팅 스킬
g coreyhaines31/marketingskills mk skills && cp -rL $T/mk/skills/* $S/ || true
# 5 아이 엠 낫 에이아이(한국어 휴머나이저) + 에이전트 4개
g epoko77-ai/im-not-ai hk "skills agents" && cp -rL $T/hk/skills/{humanize,humanize-korean,humanize-scan,humanize-redo} $S/ && cp $T/hk/agents/{humanize-monolith,humanize-diagnostician,humanize-finalizer,korean-ai-tell-taxonomist}.md $A/ || true
# 7 아키파이
g tt-a1i/archify ar "archify archify-pr" && cp -rL $T/ar/{archify,archify-pr} $S/ || true
# 8 하이퍼프레임즈
g heygen-com/hyperframes hf skills && cp -rL $T/hf/skills/* $S/ || true
rm -rf $T; true

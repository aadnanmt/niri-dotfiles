#!/usr/bin/env bash

# shellcheck source=scripts/colors.sh
source "$(dirname "$0")/colors.sh"

echo -e "${MAGENTA}==========================================${NC}"
echo -e "${MAGENTA}   LINT CHECK${NC}"
echo -e "${MAGENTA}==========================================${NC}"

ERRORS=0

# --- shellcheck ---
echo -e "\n${YELLOW}--- shellcheck ---${NC}"
if command -v shellcheck >/dev/null; then
  if find base/ scripts/ -name "*.sh" -exec shellcheck {} +; then
    echo -e "${GREEN}[OK] shellcheck${NC}"
  else
    echo -e "${RED}[FAIL] shellcheck${NC}"
    ((ERRORS++))
  fi
else
  echo -e "${YELLOW}[SKIP] shellcheck not install${NC}"
fi

# shfmt
echo -e "\n${YELLOW}--- shfmt ---${NC}"
if command -v shfmt >/dev/null; then
  if find base/ scripts/ -name "*.sh" -exec shfmt -d {} +; then
    echo -e "${GREEN}[OK] shfmt${NC}"
  else
    echo -e "${RED}[FAIL] shfmt${NC}"
    ((ERRORS++))
  fi
else
  echo -e "${YELLOW}[SKIP] shfmt not installed${NC}"
fi

# niri validate
echo -e "\n${YELLOW}--- niri validate ---${NC}"
if command -v niri >/dev/null; then
  if niri validate -c base/niri/config.kdl; then
    echo -e "${GREEN}[OK] niri${NC}"
  else
    echo -e "${RED}[FAIL] niri${NC}"
    ((ERRORS++))
  fi
else
  echo -e "${YELLOW}[SKIP] niri not installed${NC}"
fi

echo -e "${MAGENTA}==========================================${NC}"
if [ $ERRORS -eq 0 ]; then
  echo -e "${GREEN}All checks passed!${NC}"
else
  echo -e "${RED}$ERRORS check(s) failed${NC}"
fi
echo -e "${MAGENTA}==========================================${NC}"

exit $ERRORS

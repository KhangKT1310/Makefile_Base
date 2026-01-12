# ============================================================
#  Project: Makefile
# Description: Simple Makefile for C projects
# Author: KhangKT
# Date: 2026-01-12
# ============================================================

.PHONY: all clean create info

# ------------------------------------------------------------
#  Directories
# ------------------------------------------------------------
PROJECT_DIR := $(PWD)
SRC_DIR     := $(PROJECT_DIR)/source
INC_DIR     := $(PROJECT_DIR)/include
OBJ_DIR     := $(PROJECT_DIR)/build
LIB_DIR     := $(PROJECT_DIR)/libs

# ------------------------------------------------------------
#  Toolchain
# ------------------------------------------------------------
CROSS_COMPILE ?=arm-linux

ifdef CROSS_COMPILE
	CC  := $(CROSS_COMPILE)-gcc
	CXX := $(CROSS_COMPILE)-g++
else
	CC  := gcc
	CXX := g++
endif
# ------------------------------------------------------------
#  Colors (for pretty output)
# ------------------------------------------------------------
GREEN  := \033[0;32m
BLUE   := \033[0;36m
YELLOW := \033[0;33m
RED    := \033[0;31m
RESET  := \033[0m

# ------------------------------------------------------------
#  Flags
# ------------------------------------------------------------
INC_FLAGS := -I$(INC_DIR) 
LIB_FLAGS := -L$(LIB_DIR)

CFLAGS  := -Wall -Wextra -g -pthread $(INC_FLAGS)
LDFLAGS := $(LIB_FLAGS)
LDLIBS  := # -lm ...

# ------------------------------------------------------------
#  Targets
# ------------------------------------------------------------
APP_BIN := $(OBJ_DIR)/main


APP_OBJ := $(OBJ_DIR)/main.o


# ------------------------------------------------------------
#  Default
# ------------------------------------------------------------
all: info create $(APP_BIN)

info:
	@echo "$(BLUE)========================================$(RESET)"
	@echo "$(BLUE)  Building $(APP_BIN) $(RESET)"
	@echo "$(BLUE)========================================$(RESET)"
	@echo "$(YELLOW)Compiler :$(RESET) $(CC)"
	@echo "$(YELLOW)CFLAGS   :$(RESET) $(CFLAGS)"
	@echo ""

create:
	@mkdir -p $(OBJ_DIR)

# ------------------------------------------------------------
#  Link
# ------------------------------------------------------------
$(APP_BIN): $(APP_OBJ)
	@echo "$(GREEN)[LINK]$(RESET) $@"
	@$(CC) $^ -o $@ $(LDFLAGS) $(LDLIBS)

# ------------------------------------------------------------
#  Compile
# ------------------------------------------------------------
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@echo "$(BLUE)[CC]$(RESET) $<"
	@$(CC) -c $< -o $@ $(CFLAGS)

# ------------------------------------------------------------
#  Clean
# ------------------------------------------------------------
clean:
	@echo "$(RED)[CLEAN]$(RESET) remove build directory"
	@rm -rf $(OBJ_DIR)

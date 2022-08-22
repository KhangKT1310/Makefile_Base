-include ./Makefile.mk

.PHONY: all clean

MODUN_NAME	=	main
PROJECT_DIR	=	$(shell pwd)
VERSION		=	1.0.0

OBJ_DIR		=	_build

CPP=g++


RED="\033[1;31m"
GREEN="\033[3;32m"
BLUE="\033[3;34m"
YELLO="\033[1;33m"
NONE="\033[0m"

all: create $(OBJ_DIR)/$(MODUN_NAME)
	@echo ""

create:
	@mkdir -p $(OBJ_DIR)


clean:
	rm -rf $(OBJ_DIR)

$(OBJ_DIR)/$(MODUN_NAME): $(OBJ) 
	@echo $(BLUE) "link app" $@  haha $(NONE)
	@$(CPP) -o $@  $(OBJ) $(CFLAGS) $(LIBS)

$(OBJ_DIR)/%.o: %.cpp
	@echo $(GREEN) CPP  $< $(NONE)
	@$(CPP) -o $@ -c $< $(CFLAGS)

$(OBJ_DIR)/%.o: %.c
	@echo $(GREEN) CC  $< $(NONE)
	@$(CC) -o $@ -c $< $(CFLAGS)


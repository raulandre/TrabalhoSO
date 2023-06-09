# Alternative GNU Make workspace makefile autogenerated by Premake

ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifeq ($(config),debug)
  Raylib_config = debug
  Projeto_config = debug

else ifeq ($(config),release)
  Raylib_config = release
  Projeto_config = release

else
  $(error "invalid configuration $(config)")
endif

PROJECTS := Raylib Projeto

.PHONY: all clean help $(PROJECTS) 

all: $(PROJECTS)

Raylib:
ifneq (,$(Raylib_config))
	@echo "==== Building Raylib ($(Raylib_config)) ===="
	@${MAKE} --no-print-directory -C . -f Raylib.make config=$(Raylib_config)
endif

Projeto: Raylib
ifneq (,$(Projeto_config))
	@echo "==== Building Projeto ($(Projeto_config)) ===="
	@${MAKE} --no-print-directory -C . -f Projeto.make config=$(Projeto_config)
endif

clean:
	@${MAKE} --no-print-directory -C . -f Raylib.make clean
	@${MAKE} --no-print-directory -C . -f Projeto.make clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "  debug"
	@echo "  release"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   Raylib"
	@echo "   Projeto"
	@echo ""
	@echo "For more information, see https://github.com/premake/premake-core/wiki"
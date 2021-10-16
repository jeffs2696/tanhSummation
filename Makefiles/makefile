#
#  Hyperbolic Tangent 
#

F90 = gfortran 
F90FLAGS  =	\
			-g -c \
			-O0 \
			-std=f2008 \
			-fbacktrace -fcheck=all -fbounds-check -fcheck-array-temporaries \
			-ffpe-trap=denormal,invalid,zero,overflow,underflow \
			-fdump-fortran-global \
			-fimplicit-none \
			-Wall -Wline-truncation -Wcharacter-truncation -Wuninitialized  \
			-Wconversion -Wsurprising -Warray-temporaries -Wconversion-extra -Wextra -Werror \
			-Wno-error=unused-function \
			-Wno-error=compare-reals \
			-Wno-error=character-truncation \
			-Wno-error=conversion-extra \
			-Wno-error=conversion \
			-Wno-error=do-subscript
			
EXE = main.exe
FEXT     = f
F90EXT   = f90
OEXT     = o
OBJECTS  =                     \
    main.o					   

MODULES = $(OBJECTS:$(OEXT)=mod)

# Define locations for files
#
LIB_FILES = ../LibraryFiles
MOD_FILES = ../ModuleFiles
OBJ_FILES = ../ObjectFiles
EXE_FILES = ../ExecutableFiles
SRC_FILES = ../SourceFiles

#
# Define commands
#

MV_MOD = mv *.mod
MV_OBJ = mv *.o
MV_EXE = mv $(EXE) $(EXE_FILES)

RM_MOD = rm $(MOD_FILES)/*.mod 
RM_OBJ = rm $(OBJ_FILES)/*.o
RM_EXE = rm $(EXE) $(EXE_FILES)
# Defining colored output for ANSI escape sequences 
#

COM_COLOR   = \033[0;34m
OBJ_COLOR   = \033[0;36m
OK_COLOR    = \033[0;32m
ERROR_COLOR = \033[0;31m
WARN_COLOR  = \033[0;33m
NO_COLOR    = \033[m

OK_STRING = "[OK]"
ERROR_STRING = "[ERROR]"
WARN_STRING = "[WARNING]"
COM_STRING = "Compiling..."

all: main.o
	@printf "%b" "$(COM_COLOR)$(COM_COLOR) $(OBJ_COLOR)$(@)$(NO_COLOR)\n" "Compiling $@\n";
	@$(F90) -o $(EXE) $(OBJECTS) 2> $@.log; \
	RESULT=$$?; \
		if [ $$RESULT -ne 0 ]; then \
			printf "%-60b%b" "$(COM_COLOR)$(COM_STRING)$(OBJ_COLOR) $@" "$(ERROR_COLOR)$(ERROR_STRING)$(NO_COLOR)\n"; \
		elif [ -s $@.log ]; then \
			printf "%-60b%b" "$(COM_COLOR)$(COM_STRING)$(OBJ_COLOR) $@" "$(WARN_COLOR)$(WARN_STRING)$(NO_COLOR)\n"; \
			else  \
			printf "%-60b%b" "$(COM_COLOR)$(COM_STRING)$(OBJ_COLOR) $(@F)" "$(OK_COLOR)$(OK_STRING)$(NO_COLOR)\n"; \
			fi; \
			cat $@.log; \
			rm -f $@.log; \
			exit $$RESULT
	@($(MV_OBJ) $(OBJ_FILES); $(MV_EXE))
	@./$(EXE_FILES)/$(EXE)
	@(cd $(EXE_FILES); gnuplot plotData.p; \
	pdflatex -halt-on-error plotReport.tex | grep -A3 '^!'; \
	xdg-open plotReport.pdf)
#
#   Define dependency information for object files
#                                                               
main.o: \
	$(SRC_FILES)/main.f90        
	@$(F90) $(F90FLAGS) $(SRC_FILES)/main.f90

clean:
	$(RM_OBJ);


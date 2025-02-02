# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: heehkim <heehkim@student.42seoul.kr>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/18 16:05:23 by heehkim           #+#    #+#              #
#    Updated: 2022/05/03 23:37:56 by heehkim          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell

CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRCDIR = srcs/
D_BUILTIN = builtins/
D_ENV = env/
D_PARSING = parsing/
D_PIPE = pipe/
D_UTIL = util/
D_SIGNAL = signal/
D_EXECUTE = execute/
SRC_LIST = main.c \
			$(D_BUILTIN)ft_env.c \
			$(D_BUILTIN)ft_pwd.c \
			$(D_BUILTIN)ft_export.c \
			$(D_BUILTIN)ft_cd.c \
			$(D_BUILTIN)ft_unset.c \
			$(D_BUILTIN)ft_exit.c \
			$(D_BUILTIN)ft_echo.c \
			$(D_BUILTIN)utils.c \
			$(D_BUILTIN)export_utils.c \
			$(D_BUILTIN)echo_utils.c \
			$(D_ENV)get.c \
			$(D_ENV)update.c \
			$(D_ENV)remove.c \
			$(D_ENV)envp.c \
			$(D_PARSING)env.c \
			$(D_PARSING)token.c \
			$(D_PARSING)trim.c \
			$(D_PARSING)expand.c \
			$(D_PARSING)expand_env_value.c \
			$(D_PARSING)expand_util.c \
			$(D_PARSING)ast.c \
			$(D_PARSING)ast_add.c \
			$(D_PARSING)ast_simplify.c \
			$(D_PIPE)heredoc.c \
			$(D_PIPE)fork.c \
			$(D_PIPE)redirection.c \
			$(D_PIPE)execute.c \
			$(D_PIPE)util.c \
			$(D_UTIL)free.c \
			$(D_UTIL)check.c \
			$(D_UTIL)file.c \
			$(D_UTIL)print.c \
			$(D_UTIL)art.c \
			$(D_UTIL)get_next_line.c \
			$(D_SIGNAL)signal.c \
			$(D_SIGNAL)handler.c \
			$(D_EXECUTE)execute.c \
			$(D_EXECUTE)builtin.c
SRCS = $(addprefix $(SRCDIR), $(SRC_LIST))
OBJS = $(SRCS:.c=.o)

LIBDIR = libft/
LIB_FLAGS = -L$(LIBDIR) -lft

MODE = EVAL
ifeq ($(MODE), EVAL)
	READLINE_DIR= ${HOME}/.brew/Cellar/readline/8.1.2
else ifeq ($(MODE), HEEHKIM)
	READLINE_DIR = /opt/homebrew/opt/readline
else ifeq ($(MODE), SOKIM)
	READLINE_DIR = /opt/homebrew/Cellar/readline/8.1.2
endif

INC_FLAGS = -I includes -I libft -I $(READLINE_DIR)/include
LINK_FLAGS = -L${READLINE_DIR}/lib -lreadline

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@ $(INC_FLAGS)

.PHONY: all
all: $(NAME)

$(NAME): $(OBJS)
	@make -s -C $(LIBDIR)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LIB_FLAGS) $(LINK_FLAGS)

.PHONY: clean
clean:
	@make clean -s -C $(LIBDIR)
	rm -rf $(OBJS)

.PHONY: fclean
fclean: clean
	@make fclean -s -C $(LIBDIR)
	rm -rf $(NAME)

.PHONY: re
re: fclean all

.PHONY: debug
debug:
	@make -s -C $(LIBDIR)
	$(CC) $(CFLAGS) -g -o $(NAME) $(SRCS) $(INC_FLAGS) $(LIB_FLAGS) $(LINK_FLAGS)

/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   builtin.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sokim <sokim@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/18 14:43:13 by sokim             #+#    #+#             */
/*   Updated: 2022/04/18 15:33:28 by sokim            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef BUILTIN_H
# define BUILTIN_H

# include "struct.h"

/*
 * Builtin Functions
*/
int		ft_env(t_ast *ast, t_data *data);
int		ft_pwd(void);
int		ft_export(t_ast *ast, t_data *data);
int		ft_cd(t_ast *ast, t_data *data);
int		ft_unset(t_ast *ast, t_data *data);
void	ft_exit(t_ast *ast, t_data *data);
int		ft_echo(t_ast *ast);

/*
 * Util Functions
*/
int		is_valid_key_name(char *key);
int		is_str_num(char *str);
int		is_str_long_long(char *str);

#endif

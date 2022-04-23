/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   execute.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sokim <sokim@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/20 14:02:20 by sokim             #+#    #+#             */
/*   Updated: 2022/04/23 20:09:07 by sokim            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef EXECUTE_H
# define EXECUTE_H

int		exec_builtin(t_ast *ast, t_data *data);
void	execute_cmd(t_ast *ast, t_data *data);

#endif

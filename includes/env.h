/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   env.h                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sokim <sokim@student.42seoul.kr>           +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/10 13:34:53 by sokim             #+#    #+#             */
/*   Updated: 2022/04/13 00:14:24 by sokim            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef ENV_H
# define ENV_H

#include "struct.h"

t_env	*add_new_env_node(char *key, char *value);
int		update_env(t_data *data, char *key, char *value);
t_env	*get_node_with_key(t_data *data, char *key);
char	*get_env_value_with_key(t_data *data, char *key);

#endif

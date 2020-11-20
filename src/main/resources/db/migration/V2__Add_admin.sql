INSERT INTO t_user (id, username, password, email, active)
  VALUES (1, 'admin', '123', 'test@mail.ru', TRUE);

INSERT INTO user_role(user_id, roles)
  VALUES (1, 'USER'), (1, 'ADMIN')
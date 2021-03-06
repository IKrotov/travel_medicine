package com.infections.repos;

import com.infections.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);

    User findByActivationCode(String code);

    User findByEmail(String email);
}

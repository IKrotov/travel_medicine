package com.infections.repos;

import com.infections.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface MessageRepository extends JpaRepository<Message, Long> {

    Message findById(long id);
    List<Message> findByHeader(String header);
}

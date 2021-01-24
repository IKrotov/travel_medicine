package com.infections.repos;

import com.infections.model.Continent;
import com.infections.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface MessageRepository extends JpaRepository<Message, Long> {

    Message findById(long id);

    List<Message> findByHeader(String header);


    List<Message> findByContinent(Continent continent);

    @Query(value = "SELECT * FROM message ORDER BY id DESC LIMIT 3", nativeQuery = true)
    List<Message> findLast3Messages();

    List<Message> findByCountryName(String countryName);
}

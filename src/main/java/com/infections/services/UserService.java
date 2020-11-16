package com.infections.services;

import com.infections.model.Role;
import com.infections.model.User;
import com.infections.repos.RoleRepository;
import com.infections.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private MailSender mailSender;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);

        if (user == null){
            throw new UsernameNotFoundException("User not found");
        }
        return user;
    }

    public User findUserById(Long userId){
        Optional<User> userFromDb = userRepository.findById(userId);
        return userFromDb.orElse(new User());
    }

    public List<User> findAllUsers(){
        return userRepository.findAll();
    }

    public boolean saveUser(User user){
        User userFormDB = userRepository.findByUsername(user.getUsername());

        if (userFormDB != null){
            return false;
        }

        user.setRoles(Collections.singleton(new Role(1L, "ROLE_USER")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setActivationCode(UUID.randomUUID().toString());

        userRepository.save(user);

        if (!StringUtils.isEmpty(user.getEmail())){

//            String message = String.format("Здравсвуйте, %s! \n" +
//                    "Добро пожаловать! Подтвердите ваш email для завершения регистрации, перейдя по ссылке : http://localhost:8080/active/%s",
//                    user.getUsername(),
//                    user.getActivationCode()
//            );

           String message = String.format("Здравствуйте, %s! \n" +
                    "Спасибо за регистрацию! Пожалуйста, подтвердите ваш Email адрес для завершения регистрации. Для этого перейдите по ссылке : http://localhost:8080/active/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );

            mailSender.send(user.getEmail(), "Активация аккаунта", message);
        }

        return true;
    }

    public boolean deleteUser(Long userId) {
        if (userRepository.findById(userId).isPresent()) {
            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }

    public boolean changeUserAdminRole(Long userId){
        User user = userRepository.findById(userId).orElse(null);
        if (user !=null) {
            if (user.isAdmin()) {
                user.deleteAdminRole();
            } else {
                user.addAdminRole();
            }
            userRepository.save(user);
            return true;
        }
        return false;
    }

    public boolean activateUser(String code) {

        User user = userRepository.findByActivationCode(code);

        if (user == null){
            return false;
        }

        user.setActivationCode(null);

        userRepository.save(user);

        return true;
    }
}

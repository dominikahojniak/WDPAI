<?php

require_once 'Repository.php';
require_once __DIR__.'/../models/User.php';

class UserRepository extends Repository
{

    public function getUser(string $email): ?User
    {
        $stmt = $this->database->connect()->prepare('
           SELECT u.id, u.email, u.password, u.name, u.role 
    FROM users u 
    LEFT JOIN users_details ud ON u.id_user_details = ud.id 
    WHERE email = :email
        ');
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->execute();

        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user == false) {
            return null;
        }
        $userObject = new User(
            $user['email'],
            $user['password'],
            $user['name'],
            $user['role']
        );

        if (isset($user['id'])) {
            $userObject->setId((int)$user['id']);
        }

        return $userObject;
    }
    public function addUser(User $user)
    {
        $stmt = $this->database->connect()->prepare('
            INSERT INTO users_details (phone)
            VALUES (?)
        ');

        $stmt->execute([
            $user->getPhone()
        ]);

        $stmt = $this->database->connect()->prepare('
            INSERT INTO public.users (email, password, name, id_user_details,role)
            VALUES (?, ?, ?, ?,?)
        ');

        $stmt->execute([
            $user->getEmail(),
            $user->getPassword(),
            $user->getName(),
            $this->getUserDetailsId($user),
            $user->getRole()
        ]);

    }
    public function getUserDetailsId(User $user): int
    {
        $stmt = $this->database->connect()->prepare('
            SELECT * FROM public.users_details WHERE phone = :phone
        ');
        $phone = $user->getPhone();
        $stmt->bindParam(':phone', $phone, PDO::PARAM_STR);
        $stmt->execute();

        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        return $data['id'];
    }
}
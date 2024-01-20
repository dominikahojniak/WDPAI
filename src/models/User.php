<?php


class User{
    private $email;
    private $password;
    private $name;
    private $phone;


    public function __construct(string $email, string $password, string $name){
    $this->email = $email;
    $this->password = $password;
    $this-> name = $name;
    }
    public function getEmail(): string 
    {
        return $this->email;
    }

    public function getPassword() : string
    {
        return $this->password;
    }

    public function getName(): string
    {
        return $this->name;
    }
    public function getPhone()
    {
        return $this->phone;
    }
    public function setPhone($phone): void
    {
        $this->phone = $phone;
    }
    public function setEmail(string $email): void
    {
        $this->email = $email;
    }
    public function setPassword(string $password): void
    {
        $this->password = $password;
    }
    public function setName(string $name): void
    {
        $this->name = $name;
    }

}
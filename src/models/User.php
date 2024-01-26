<?php


class User{
    private $email;
    private $password;
    private $name;
    private $phone;
    private $role;
    private $id;

    public function __construct(string $email, string $password, string $name, $role = 'user'){
    $this->email = $email;
    $this->password = $password;
    $this-> name = $name;
    $this->role = $role;

    }
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id): void
    {
        $this->id = $id;
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
    public function getRole() {
        return $this->role;
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
    public function setRole($role): void
    {
        $this->role = $role;
    }

}
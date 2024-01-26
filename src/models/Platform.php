<?php
class Platform
{
private $id;
private $name;
private $image;
private $link;

public function __construct($id, $name, $image, $link)
{
$this->id = $id;
$this->name = $name;
$this->image = $image;
$this->link = $link;
}

// Getters
public function getId()
{
return $this->id;
}

public function getName()
{
return $this->name;
}

public function getImage()
{
return $this->image;
}

public function getLink()
{
return $this->link;
}
}
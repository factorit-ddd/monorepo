<?php
declare(strict_types=1);

namespace Jifeline\Products\Domain;

class Product
{
    public static function create(ProductId $id): self
    {
        return new self($id);
    }

    private function __construct(private ProductId $id)
    {

    }

    public function id(): ProductId
    {
        return $this->id;
    }

    public function toArray(): array
    {
        return [
            'id' => $this->id->toString(),
        ];
    }
}

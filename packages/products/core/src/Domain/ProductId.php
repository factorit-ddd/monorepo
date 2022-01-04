<?php
declare(strict_types=1);

namespace Jifeline\Products\Domain;

final class ProductId
{
    public static function generate(): self
    {
        return new self('abc-'.rand(0, 1000));
    }

    private function __construct(private string $id)
    {
    }

    public function toString(): string
    {
        return $this->id;
    }
}

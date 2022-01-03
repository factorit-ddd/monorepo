<?php
declare(strict_types=1);

namespace Jifeline\Shared\Core\Application\Contracts;

interface Validator
{
    public function validate($value): ValidatorConstraintViolations;
}

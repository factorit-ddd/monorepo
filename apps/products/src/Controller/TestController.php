<?php
declare(strict_types=1);

namespace Products\Controller;

use Jifeline\Products\Domain\Product;
use Jifeline\Products\Domain\ProductId;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TestController
{
    #[Route(path: "/test", methods: ["GET"])]
    public function testAction(): Response
    {
        $data = Product::create(ProductId::generate());

        return new JsonResponse($data->toArray());
    }
}

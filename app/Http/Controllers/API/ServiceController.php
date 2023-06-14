<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Service;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    public function all(Request $request)
    {
        $id = $request->input('id');
        $limit = $request->input('limit');
        $name = $request->input('name');
        $description = $request->input('description');
        $tags = $request->input('tags');
        $categories = $request->input('categories');

        $price_from = $request->input('price_from');
        $price_to = $request->input('price_to');

        if ($id) {
            $service = Service::with(['category', 'galleries'])->find($id);

            if ($service) {
                return ResponseFormatter::success(
                    $service,
                    'Data service berhasil diambil'
                );
            } else {
                return ResponseFormatter::error(
                    null,
                    'Data service tidak ada',
                    404
                );
            }
        }

        $service = Service::with(['category', 'galleries']);

        if ($name) {
            $service->where('name', 'like', '%' . $name . '%');
        }

        if ($description) {
            $service->where('description', 'like', '%' . $description . '%');
        }

        if ($tags) {
            $service->where('tags', 'like', '%' . $tags . '%');
        }

        if ($price_from) {
            $service->where('price', '>=', $price_from);
        }

        if ($price_to) {
            $service->where('price', '<=', $price_to);
        }

        if ($categories) {
            $service->where('categories', $categories);
        }

        return ResponseFormatter::success(
            $service->paginate($limit),
            'Data service berhasil diambil'
        );
    }
}

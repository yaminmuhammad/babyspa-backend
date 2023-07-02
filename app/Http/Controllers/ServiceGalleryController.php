<?php

namespace App\Http\Controllers;

use App\Http\Requests\ServiceGalleryRequest;
use App\Models\Service;
use App\Models\ServiceGallery;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class ServiceGalleryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Service $service)
    {
        if (request()->ajax()) {
            $query = ServiceGallery::where('services_id', $service->id);

            return DataTables::of($query)
                ->addColumn('action', function ($item) {
                    return '
                        <form class="inline-block" action="' . route('dashboard.gallery.destroy', $item->id) . '" method="POST">
                        <button class="border border-red-500 bg-red-500 text-white rounded-md px-2 py-1 m-2 transition duration-500 ease select-none hover:bg-red-600 focus:outline-none focus:shadow-outline" >
                            Hapus
                        </button>
                            ' . method_field('delete') . csrf_field() . '
                        </form>';
                })
                ->editColumn('url', function ($item) {
                    return '<img style="max-width: 150px;" src="' . $item->url . '"/>';
                })
                ->editColumn('is_featured', function ($item) {
                    return $item->is_featured ? 'Yes' : 'No';
                })
                ->rawColumns(['action', 'url'])
                ->make();
        }

        return view('pages.dashboard.gallery.index', compact('service'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Service $service)
    {
        return view('pages.dashboard.gallery.create', compact('service'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(ServiceGalleryRequest $request, Service $service)
    {
        $files = $request->file('files');

        if ($request->hasFile('files')) {
            foreach ($files as $file) {
                $path = $file->store('public/gallery');

                ServiceGallery::create([
                    'services_id' => $service->id,
                    'url' => $path
                ]);
            }
        }
        return redirect()->route('dashboard.service.gallery.index', $service->id);
    }

    /**
     * Display the specified resource.
     */
    public function show(ServiceGallery $gallery)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ServiceGallery $gallery)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(ServiceGalleryRequest $request, ServiceGallery $gallery)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ServiceGallery $gallery)
    {
        $gallery->delete();

        return redirect()->route('dashboard.product.gallery.index', $gallery->products_id);
    }
}

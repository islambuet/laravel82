<?php

namespace App\Http\Livewire;

use Livewire\Component;

class NotFoundComponent extends Component
{
    public function render()
    {
        return view('theme.404')->layout('theme.component');
    }
}

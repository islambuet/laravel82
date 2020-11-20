<?php

namespace App\Actions\Fortify;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Laravel\Fortify\Contracts\CreatesNewUsers;

class CreateNewUser implements CreatesNewUsers
{
    use PasswordValidationRules;

    /**
     * Validate and create a newly registered user.
     *
     * @param  array  $input
     * @return \App\Models\User
     */
    public function create(array $input)
    {
        Validator::make($input, [                        
            'name_en' => ['required', 'string', 'max:255'],
            'name_bn' => ['required', 'string', 'max:255'],
            'mobile_no' => ['required', 'string', 'size:11', 'unique:users'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],            
            'password' => $this->passwordRules(),
        ])->validate();
        
        return User::create([
            'name_en' => $input['name_en'],
            'name_bn' => $input['name_bn'],
            'mobile_no' => $input['mobile_no'],
            'email' => $input['email'],
            'password' => Hash::make($input['password']),
        ]);
    }
}

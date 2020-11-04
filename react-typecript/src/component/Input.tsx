import React, { ChangeEvent, FormEvent, FunctionComponent } from 'react';
import '../index.css';

export type InputProps = {
    type: string,
    name: string,
    placeholder: string,
    onChange: (s: string) => void,
    value: string
}

export function getValueFromEvent(e: ChangeEvent<HTMLInputElement> | FormEvent<HTMLFormElement>) {
    return (e.target as HTMLInputElement).value
}

const Input: FunctionComponent<InputProps> = ({ type, name, placeholder, onChange, value }) => {

    return <input
        type={type}
        name={name}
        placeholder={placeholder}
        onChange={(e) => onChange(getValueFromEvent(e))}
        value={value}
    />

}

export default Input;

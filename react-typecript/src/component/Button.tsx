import React, { FunctionComponent } from 'react';
import '../index.css';

export type ButtonProps = {
    type: "button" | "submit";
    isDisabled: boolean,
    text: string,
    onClick: () => void
}

const Button: FunctionComponent<ButtonProps> = ({ type, isDisabled, text, onClick }) => {

    return <button
        disabled={isDisabled}
        onClick={() => onClick()}
        type={type}
    >
        {text}
    </button>
}

export default Button;

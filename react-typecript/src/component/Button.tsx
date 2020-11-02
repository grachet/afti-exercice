import React from 'react';
import '../index.css';

export default function Button({ text: otherTextName }: { text: string }) {

    return <button onClick={() => { alert(otherTextName) }}>
        {otherTextName}
    </button>
}
import React from 'react';
import '../index.css';

export default function List({ text: otherTextName }: { text: string }) {

    return <button>
        {otherTextName}
    </button>
}
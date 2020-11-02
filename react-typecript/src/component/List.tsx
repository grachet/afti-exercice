import React from 'react';
import '../index.css';
import Button from './Button';

export default function List({ list }: { list: Array<string> }) {

    return <div style={{ width: 200 }}>
        <ul>
            {list.map((text: string) => {
                return <li><Button text={text} /></li>
            })}
        </ul>
    </div>
}
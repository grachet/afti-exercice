import React, { FunctionComponent } from 'react';
import '../index.css';
import Button from './Button';

export type ListProps = {
    list: Array<string>
    removeFromList: (index: number) => void
}

const List: FunctionComponent<ListProps> = ({ list, removeFromList }) => {

    return <div style={{ width: 200 }}>
        <ul>
            {list.map((task: string, index: number) => {
                return <li key={index}>
                    <Button
                        type="submit"
                        onClick={() => removeFromList(index)}
                        isDisabled={false}
                        text={task}
                    />
                </li>
            })}
        </ul>
    </div>
}

export default List;



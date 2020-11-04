import React, { FormEvent, FunctionComponent, useState } from 'react';
import Button from './Button';
import Input from './Input';
import List from './List';

export type FormWrapperProps = {
}

const FormWrapper: FunctionComponent<FormWrapperProps> = () => {

    const [list, setList] = useState<Array<string>>([]);
    const [textInputValue, setTextInputValue] = useState<string>("");

    const removeFromList = (index: number) => {
        setList(list => {
            let newList = [...list]
            return newList.filter((_, i) => i !== index)
        })
    }

    const addToList = (e: FormEvent<HTMLFormElement>) => {
        e.preventDefault()
        setList(list => [...list, textInputValue])
        setTextInputValue("")
    }

    return <div className="formWrapper">
        <form onSubmit={(e) => addToList(e)}>
            <Input
                type="text"
                name="rechercher"
                placeholder="saisissez votre recherche..."
                onChange={(s) => setTextInputValue(s)}
                value={textInputValue}
            />
            <Button type="submit" text="valider" isDisabled={!textInputValue} onClick={() => null} />
        </form>
        <br />
        <List list={list} removeFromList={removeFromList} />
    </div>
}

export default FormWrapper;
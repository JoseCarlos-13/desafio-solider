import React from 'react'
import './Form.css'
import { TextField, Button, FormControl, FormLabel, RadioGroup, 
         FormControlLabel, Radio } from '@mui/material';

export default function Form (props) {
  return (
    <React.Fragment>
      <div>
        <form>
          <TextField label='Nome completo' className='form-field' />
          <TextField label='CPF' className='form-field'/>
          <TextField label='CNS' className='form-field'/>
          <TextField label='Email' className='form-field' />
          <TextField type='date' className='form-field' />
          <TextField label='Telefone' className='form-field' />
          <FormControl className='radio-buttons-div'>
            <FormLabel>Status</FormLabel>
            <RadioGroup className='radio-buttons'>
              <FormControlLabel value="active" control={<Radio />} label="Ativo" />
              <FormControlLabel value="inactive" control={<Radio />} label="Inativo" />
            </RadioGroup>
          </FormControl>
          <Button component="label" className='upload-button'>
            Enviar foto
            <input hidden accept="image/*" multiple type="file" />
          </Button>
          <Button variant='contained'>Cadastrar</Button>
        </form>
      </div>
    </React.Fragment>
  )
}

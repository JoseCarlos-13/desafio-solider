import React from 'react'
import Form from '../../components/Form/Form'
import './FormScreen.css'
import '../../index.css'

  // let [full_name] = setState('')

//  const updateInputs = (event) => {
//   person: {
//     name: event.target.value
//   }
//  }

export default function FormScreen () {
  return (
    <React.Fragment>
      <div className='container'>
        <Form></Form>
      </div>
    </React.Fragment>
  )
}

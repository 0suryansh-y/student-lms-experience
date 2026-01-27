// import React, {useState} from 'react'
// import ReactDOM from 'react-dom/client'
// import { RouterProvider } from '@tanstack/react-router'
// import { flushSync } from 'react-dom'
// import { router } from './router'
// import type { User } from '@/types'

// function App() {
//   const [user, setUser] = useState<User | null>(null)

//   const login = (u: User) => {
//     flushSync(() => {
//       setUser(u)
//     })
//     router.invalidate()
//   }

//   const logout = () => {
//     flushSync(() => {
//       setUser(null)
//     })
//     router.invalidate()
//   }

//   return (
//     <RouterProvider
//       router={router}
//       context={{
//         user,
//         login,
//         logout
//       }}
//     />
//   )
// }

// ReactDOM.createRoot(document.getElementById('root')!).render(<App />)

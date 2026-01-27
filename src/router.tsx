import { createRouter } from '@tanstack/react-router'
import { routeTree } from './routeTree.gen'

export const getRouter = () => {
  const router = createRouter({
    routeTree,
    context: {
      user: {id: '2', name: 'S'},
      login: () => {},
      logout: () => {},
    },
    scrollRestoration: false,
    defaultPreloadStaleTime: 0,
  })

  return router
}
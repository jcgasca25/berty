import React, { useState, useRef } from 'react'
import {
	useLinking,
	NavigationContainer as ReactNavigationContainer,
} from '@react-navigation/native'
import { Routes } from './types'
import { Messenger } from '@berty-tech/hooks'

export const PREFIX = 'berty://'

export const NavigationContainer: React.FC = ({ children }) => {
	const ref = useRef()
	const handleDeepLink = Messenger.useHandleDeepLink()
	const { getInitialState } = useLinking(ref, {
		prefixes: [PREFIX],
		config: {
			initialRouteName: 'Tabs',
			screens: {
				['Modals']: {
					screens: {
						[Routes.Modals.ManageDeepLink]: {
							path: 'id/:link',
							parse: {
								link: (data) => {
									const link = `${PREFIX}id/${data}`
									handleDeepLink(link)
									return link
								},
							},
						},
						[Routes.Modals.ManageDeepLink2]: {
							path: 'group/:link',
							parse: {
								link: (data) => {
									const link = `${PREFIX}group/${data}`
									handleDeepLink(link)
									return link
								},
							},
						},
					},
				},
			},
		},
	})

	const [isReady, setIsReady] = useState(false)
	const [initialState, setInitialState] = useState()

	React.useEffect(() => {
		Promise.race([
			getInitialState(),
			new Promise((resolve) =>
				// Timeout in 150ms if `getInitialState` doesn't resolve
				// Workaround for https://github.com/facebook/react-native/issues/25675
				setTimeout(resolve, 150),
			),
		])
			.catch((e) => {
				console.error(e)
			})
			.then((state) => {
				if (state !== undefined) {
					setInitialState(state as any)
				}

				setIsReady(true)
			})
	}, [getInitialState])

	if (!isReady) {
		return null
	}

	return (
		<ReactNavigationContainer initialState={initialState} ref={ref}>
			{children}
		</ReactNavigationContainer>
	)
}

Class {
	#name : #GtkListAdapterSingleSelectionTest,
	#superclass : #GtkAbstractListAdapterSingleSelectionTest,
	#category : #'Mars-GtkBackendTests'
}

{ #category : #running }
GtkListAdapterSingleSelectionTest >> classToTest [
	^ SpListPresenter
]

{ #category : #running }
GtkListAdapterSingleSelectionTest >> setUp [

	super setUp.

	window := presenter
		beSingleSelection;
		items: #(10 20 30);
		openWithSpec.
]

"
* GtkTreeIter:
 * @stamp: a unique stamp to catch invalid iterators
 * @user_data: model-specific data
 * @user_data2: model-specific data
 * @user_data3: model-specific data
 *
 * The #GtkTreeIter is the primary structure
 * for accessing a #GtkTreeModel. Models are expected to put a unique
 * integer in the @stamp member, and put
 * model-specific data in the three @user_data
 * members.
"
Class {
	#name : #GtkTreeIter,
	#superclass : #GtkAbstractIter,
	#category : #'Mars-Gtk-Widget-Tree'
}

{ #category : #accessing }
GtkTreeIter >> appendNew [
	| iterator |

	iterator := GtkTreeIter on: self store.
	self gtkTreeStoreAppend: iterator parent: self.
	
	^ iterator
]

{ #category : #accessing }
GtkTreeIter >> appendNewRoot [

	^ self 
		gtkTreeStoreAppend: self 
		parent: nil
]

{ #category : #private }
GtkTreeIter >> atColumnIndex: index setBoolean: aValue [
	"Just a convenience method to avoid adding an extra zero to all Strings"

	 self ffiCall: #(void gtk_tree_store_set (GtkTreeStore *store, self, uint index, gboolean aValue, -1))
]

{ #category : #private }
GtkTreeIter >> atColumnIndex: index setString: aValue [
	"Just a convenience method to avoid adding an extra zero to all Strings"

	 self ffiCall: #(void gtk_tree_store_set (GtkTreeStore *store, self, uint index, String aValue, -1))
]

{ #category : #private }
GtkTreeIter >> atColumnIndex: index setValue: aValue [

	 self ffiCall: #(void gtk_tree_store_set (GtkTreeStore *store, self, uint index, void* aValue, -1))
]

{ #category : #iterating }
GtkTreeIter >> childrenDo: aBlock [ 
	| child more |

	child := self firstChild.
	more := child notNil.
	[ more ] whileTrue: [
		aBlock value: child.
 		more := child next ]
	
]

{ #category : #'private iterating' }
GtkTreeIter >> firstChild [
	| childIter |

	childIter := self copyInMemory.
	^ (self gtkTreeModelIterChildrenOf: self into: childIter) 
		ifTrue: [ childIter ]
		ifFalse: [ nil ]
]

{ #category : #private }
GtkTreeIter >> getStringAtColumnIndex: index into: aValue [

	 self ffiCall: #(void gtk_tree_model_get (
		GtkTreeStore *store, 
		self, 
		uint index, 
		void *aValue, 
		-1))
]

{ #category : #private }
GtkTreeIter >> gtkTreeModelIterChildrenOf: parent into: iter [

	^ self ffiCall: #(gboolean gtk_tree_model_iter_children (
		GtkTreeStore *store,
 		GtkTreeIter *iter,
 		GtkTreeIter *parent))
]

{ #category : #private }
GtkTreeIter >> gtkTreeStoreAppend: iter parent: parent [

	^ self ffiCall: #(void gtk_tree_store_append (
		GtkTreeStore* store, 
		GtkTreeIter* iter, 
		GtkTreeIter* parent))
]

{ #category : #testing }
GtkTreeIter >> hasChildren [

	^ self ffiCall: #(gboolean gtk_tree_model_iter_has_child (
		GtkTreeStore *store,
 		self))
]

{ #category : #'private iterating' }
GtkTreeIter >> next [ 

	^ self ffiCall: #(gboolean gtk_tree_model_iter_next (GtkTreeStore *store, self))
]

{ #category : #'private iterating' }
GtkTreeIter >> previous [

	^ self ffiCall: #(gboolean gtk_tree_model_iter_previous (GtkTreeStore *store, self))
]

{ #category : #accessing }
GtkTreeIter >> setValues: aValueArray [

	^ self ffiCall: #(void gtk_tree_store_set_valist (
		GtkTreeStore *store,
		self,
		void *aValueArray))
]

{ #category : #'accessing structure variables' }
GtkTreeIter >> stamp [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_STAMP
]

{ #category : #'accessing structure variables' }
GtkTreeIter >> stamp: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_STAMP put: anObject
]

{ #category : #converting }
GtkTreeIter >> toPath [

	^ self ffiCall: #(GtkTreePath *gtk_tree_model_get_path (
		GtkTreeStore *store,
		self))
]

{ #category : #converting }
GtkTreeIter >> toPathArray [

	^ self toPath toArray
]

{ #category : #'accessing structure variables' }
GtkTreeIter >> user_data [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USER_DATA) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtkTreeIter >> user_data2 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USER_DATA2) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtkTreeIter >> user_data2: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USER_DATA2 put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtkTreeIter >> user_data3 [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USER_DATA3) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtkTreeIter >> user_data3: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USER_DATA3 put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtkTreeIter >> user_data: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USER_DATA put: anObject getHandle.
]

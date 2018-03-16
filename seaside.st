"this uses FileTree to load back the code from the /home/deploy folder"
(MCFileTreeRepository new directory: '/home/deploy' asFileReference) packageDescriptionsFromReadableFileNames  do:
  [:name || version |
  version := (MCFileTreeRepository new directory: '/home/deploy' asFileReference) versionFromFileNamed: name first, '.package'.
  [version load ]
        on: MCMergeOrLoadWarning
        do: [ :ex | [ ex load  ] on: MCNoChangesException do: [] ] ].


FileStream stdout nextPutAll: 'WebCounter installed'; lf.

"the Clever Cloud platform expects the app to listen on the 8080 port"
ZnZincServerAdaptor startOn: 8080.

"Register the code we just loaded on the /webcounter address"
WAAdmin register: WebCounter asApplicationAt: 'WebCounter'.
WAAdmin defaultDispatcher defaultName: 'WebCounter'
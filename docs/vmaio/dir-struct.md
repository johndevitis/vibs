

```{.mermaid width=1920 format=png}

graph TD
    root[root] --- modal[modal]
    docs --- plans[plans]
    root --- models[models]
    models --- apriori[apriori]
    models --- sensitivity[sensitivity]
    models --- updating[updating]
    root --- docs[docs]
    subgraph vma directory structure
    modal --- span1[span1]
    modal --- span1conf((span1.conf))
    modal --- dof((dof.csv))
    span1 --- span1h5((span1.h5))
    modal --- data[data]
    modal --- readme((readme.md))
    data --- bin[bin]
    data --- ref1h5((ref1.h5))
    data --- ref2h5((ref2.h5))
    data --- rov1h5((rov1.h5))
    bin --- ref1[ref1]
    bin --- ref2[ref2]
    bin --- rov1[rov1]
    bin --- ref1conf((ref1.conf))
    bin --- ref2conf((ref2.conf))
    bin --- rov1conf((rov1.conf))
    end
```

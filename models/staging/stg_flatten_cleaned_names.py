from fuzzywuzzy import process

def model(dbt, session):
    dbt.config(
        materialized="table"
        , packages=["fuzzywuzzy"]
    )

    df_dishes = dbt.ref("base_dishes").to_pandas()

    def custom_scorer(string):
        x = process.extractOne(string, df_dishes.NAME, score_cutoff=60)
        if x is not None:
            return x[0]
        else:
            return None
    
    return  (dbt.ref("fuzzy_words").to_pandas()
                .assign( dish_name=lambda df: df.DISH_USER_INPUT.apply(custom_scorer) )
    )
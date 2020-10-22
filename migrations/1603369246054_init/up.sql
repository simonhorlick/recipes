CREATE TABLE public.ingredients (
    amount numeric NOT NULL,
    amount_unit text NOT NULL,
    name text NOT NULL,
    additional_information text NOT NULL,
    id integer NOT NULL,
    recipe integer NOT NULL
);
COMMENT ON TABLE public.ingredients IS 'An ingredient on a particular recipe';
CREATE SEQUENCE public.ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;
CREATE TABLE public.recipes (
    id integer NOT NULL,
    name text NOT NULL,
    cover_image_url text NOT NULL,
    description text NOT NULL,
    instructions text NOT NULL
);
COMMENT ON TABLE public.recipes IS 'A recipe for a particular dish';
CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;
ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);
ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);
ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_recipe_fkey FOREIGN KEY (recipe) REFERENCES public.recipes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;

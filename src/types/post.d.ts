interface PostMetaType {
  date: string;
  description: string;
  tags: Array<string>;
  thumbnailUrl: string;
  title: string;
}

interface PostType {
  frontMatter: PostMetaType;
  content: MDXRemoteSerializeResult;
  slug: string;
}

interface PostParams {
  params: {
    slug: string;
  };
}

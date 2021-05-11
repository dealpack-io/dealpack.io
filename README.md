# dealpack.io

This is the base framework for the dealpack.io C2C platform.  
You can easily build an online C2C service by adding the necessary modules provided in this base framework.

これはdealpack.io C2Cプラットフォームの基底フレームワークです。  
この基底フレームワークに用意された必要なモジュールを追加することで簡単にオンラインC2Cサービスを構築することができます。

## Licence

[MIT](https://github.com/dealpack.io/dealpack.io/blob/master/LICENCE)

## Overview

This base framework is built by Laravel 8.

In addition to the basic functions installed in Laravel, such as session management, cache and i18n, the following functions are included.

- Authentication (Customized Fortify + Jetstream + Inertia)
- Module management (things based on laravel-modules)
- Basic View (basic layout of frontend and admin)
- Introduced Vue + Vuetify as a front-end framework

You can build an online C2C service by adding the following required modules to this base framework.  
Each required module with only basic functionality is provided by dealpack.io, but you can customize them or replace them with your own modules to freely configure the online C2C service you want to run.

- Seller identity verification module
- Product / Offer registration module
- Product-purchase / Offer-sales module
- Customer Support Module
- Troubleshooting knowledge base module

この基底フレームワークはLaravel 8によって構築されています。

セッション管理機能・キャッシュ機能・国際化機能などLaravelに搭載されいている基本機能以外に以下の機能が含まれます。

- 認証機能（Fortify + Jetstream + Inertiaをカスタマイズしたモノ）
- モジュール管理（laravel-modulesをベースにしたモノ）
- 基本View（フロントエンドと管理画面の基本レイアウト）
- フロントエンドフレームワークとしてVue + Vuetifyを導入

この基底フレームワークに以下の必須モジュールを追加することでオンラインC2Cサービスを構築することができます。  
基本的な機能だけをもつ各必須モジュールはdealpack.ioによって提供されますが、それらをカスタマイズしたり、独自のモジュールに置き換えたりすることで運営したいオンラインC2Cサービスを自由に構成できます。

- 販売者本人確認モジュール
- 商品／オファー登録モジュール
- 商品購入／オファー販売モジュール
- カスタマーサポートモジュール
- トラブル対応ナレッジベースモジュール

## Milestones

　 | Expected release date for ver. 1.0.0
--|--
 基底フレームワーク(Base Framework) | [〜2021/12](https://github.com/dealpack-io/dealpack.io/milestone/1)
 販売者本人確認モジュール(Seller identity verification module) | 〜2022/?
 商品／オファー登録モジュール(Product / Offer registration module) | 〜2022/?
 商品購入／オファー販売モジュール(Product-purchase / Offer-sales module) | 〜2022/?
 カスタマーサポートモジュール(Customer Support Module) | 〜2022/?
 トラブル対応ナレッジベースモジュール(Troubleshooting knowledge base module) | 〜2022/?

## We need your contribute!

We are looking for collaborators to carry out this project reliably and with high quality.  
Until the release of ver.1.0.0, we are looking for individual developers to participate in the project as partners. If you are interested in this job, please send an email to devmaster@dealpack.io with a self-introduction.  
After the release of ver.1.0.0, I would like to proceed with development and documentation with the GitHub Flow workflow as a normal OSS project.

我々はこのプロジェクトを確実かつ、高品質に実施するために協力者を募集しています。  
ver.1.0.0のリリースまでについてはパートナーとしてプロジェクトに参加してくれる個人開発者を募集しています。もしこの仕事に興味のある方はdevmaster@dealpack.ioまで、自己紹介を添えてメールを送ってください。  
ver.1.0.0リリース後は通常のOSSプロジェクトとしてGitHub Flowワークフローで開発・ドキュメンテーションなどを進めたいと思っています。

## Who we are?

- [Keisuke Mutoh (Office ORA)](https://office-ora.com)

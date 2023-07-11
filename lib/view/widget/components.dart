import 'package:flutter/material.dart';
import 'package:word_mafia_app/core/constants.dart';

Widget customBlueGrayButton({
  required BuildContext context,
  required String text,
}) {
  return Container(
    height: 64,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: AppColor.customBlueGray,
      boxShadow: AppShadow.button,
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 32,
          color: AppColor.customWhiteText,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget customWordCard({required BuildContext context, required String word, required bool showCard}) {
  return showCard
      ? Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 12,
            vertical: MediaQuery.of(context).size.height / 60,
          ),
          decoration: BoxDecoration(
            color: AppColor.customWhiteBackground,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 20,
                ),
                // width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  word,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColor.customBlackText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      : Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 12,
            vertical: MediaQuery.of(context).size.height / 60,
          ),
          decoration: BoxDecoration(
            color: AppColor.customNavyBlue,
            image: DecorationImage(
              image: AssetImage(AppImage.BackCardVector),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
        );
}

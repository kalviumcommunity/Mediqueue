# Mediqueue
# **Project Plan & MVP Document: MediQueue**

## 1.Problem Statement & Solution Overview

Problem Statement:

In Tier-2/3 cities, hospitals still rely on physical queues for appointments, causing:

Long waiting times and crowding in waiting areas

Inefficient patient flow management

Stress for patients and hospital staff

No transparency in queue status

Solution Overview:

QMed Smart Queue is a lightweight digital queueing system that transforms hospital appointment management using:

Mobile-first approach: Patients use smartphones to join queues remotely

Real-time updates: Firebase provides live queue status

Multi-channel notifications: App notifications, SMS, and in-hospital displays

Minimal infrastructure: Cloud-based solution requiring only basic tablets for hospitals

**Why Mobile?**

70%+ smartphone penetration even in Tier-2/3 cities

Patients can wait comfortably elsewhere instead of crowding hospitals

Reduces physical contact - crucial post-pandemic

Familiar interface for users (WhatsApp-like experience)

## 2.Scope & Boundaries

✅ IN SCOPE (MVP)


Patient mobile app (Flutter) for queue management

Hospital admin dashboard (Flutter Web)

Simple registration (Name, Phone, optional email)

Firestore for real-time queue data

Basic SMS notifications (via Cloud Functions)

QR code-based hospital registration

Real-time queue position tracking

APK build and Firebase web hosting



❌ OUT OF SCOPE (Future Phases)


Electronic Health Records (EHR) integration

Payment gateway integration

AI-based wait time prediction

Multi-language support (beyond English)

Offline mode for poor connectivity areas

Integration with government health schemes

Advanced analytics and reporting



## 3. Roles & Responsibilities

                   Role                               Team Member            Key Responsibilities
          Product Lead & Firebase Specialist       Isaac Reji         Overall coordination, requirements, Firebase setup, Auth, Firestore, Cloud Functions, demo preparation
          Flutter Development Lead                 Claudia Jerome     Patient app UI/UX, admin dashboard, state management, Flutter Web implementation
          UI/UX & Testing Lead                     Danushri           App design, wireframes, testing, APK builds, Firebase hosting, documentation

## 4. Sprint Timeline (4 Weeks)

Week 1: Foundation & Design

Focus: Setup, planning, and initial design
Deliverables:

✅ Project repository setup (GitHub)

✅ Firebase project creation and configuration

✅ App wireframes and UI mockups

✅ Firestore database schema design

✅ Project folder structure in Flutter

✅ Basic splash screen and onboarding UI

Week 2: Core Development

Focus: Registration and basic queue functionality
Deliverables:

✅ Simple registration system (Name, Phone, optional email)

✅ Patient app: QR scanner for hospital registration

✅ Patient app: Queue joining interface

✅ Firestore CRUD operations for queue management

✅ Basic admin dashboard layout

✅ Real-time queue updates using StreamBuilder

Week 3: Integration & Testing

Focus: Connecting all components and testing
Deliverables:

✅ Complete queue flow: Join → Wait → Notify → Complete

✅ Admin dashboard: Queue management controls

✅ Cloud Functions for SMS notifications

✅ Error handling and form validation

✅ Manual testing on 2+ devices

✅ Basic widget tests

Week 4: MVP Completion & Deployment

Focus: Polish, testing, and deployment
Deliverables:

✅ UI polish and animations

✅ APK build for Android

✅ Firebase web hosting for admin dashboard

✅ Demo preparation with sample data

✅ Documentation (README, setup guide)

✅ Final presentation/demo

## 5. MVP Features

**Must-Have Features (Core MVP)**

Patient Mobile App:


Simple registration (Name, Phone, optional email)

QR code scanner to select hospital

Join queue with department selection

Real-time queue position display

Push notifications when turn is near

Cancel queue option



Hospital Admin Dashboard:


Real-time queue view

"Call Next Patient" button

Mark patient as completed/no-show

Simple counter management

Today's queue statistics

Backend Services:


Firebase Authentication

Firestore real-time database

Cloud Functions for SMS notifications

Basic security rules

Demo-Ready Features


Working APK that can be installed and tested

Live admin dashboard (hosted on Firebase)

Sample hospital with test data

End-to-end queue flow demonstration



## 6. Functional Requirements

FR1: Authentication


Users can register using simple form (Name, Phone, optional email)

Session persistence across app restarts

Logout functionality



FR2: Queue Management


Patients can join queue by scanning hospital QR code

Real-time queue position updates

Patients receive notification 2 patients before their turn

Patients can cancel their queue position



FR3: Hospital Admin


Admin can view current queue in real-time

Admin can call next patient with one click

Admin can mark patients as completed/no-show

Admin can see basic queue statistics



FR4: Notifications


In-app push notifications for queue updates

SMS fallback for critical updates (via Cloud Functions)

Sound/vibration alerts for turn notification



## 7. Non-Functional Requirements

NFR1: Performance


App launch time < 3 seconds

Queue updates within 2 seconds

Works on Android 8.0+ devices

APK size < 15MB



NFR2: Scalability


Support 100+ concurrent users per hospital

Firestore reads optimized with pagination

Efficient data structure for real-time updates



NFR3: Security


Firestore security rules implemented

No PII stored in plain text

API keys secured in Firebase environment



NFR4: Usability


Intuitive UI with minimal taps to join queue

Clear visual feedback for all actions

Works in portrait and landscape modes

Accessible font sizes and contrast



## 8. Success Metrics

Technical Metrics

✅ All MVP features functional by Week 4

✅ APK builds successfully without errors

✅ Firebase integration working end-to-end

✅ Real-time updates working reliably

✅ App tested on minimum 2 Android devices

Team Metrics

✅ All team members contributing code weekly

✅ Daily standups completed

✅ Code reviews conducted for major PRs

✅ Documentation completed

✅ Demo prepared with working example
